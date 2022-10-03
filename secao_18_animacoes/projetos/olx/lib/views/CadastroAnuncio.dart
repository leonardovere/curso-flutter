import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olx/models/Anuncio.dart';
import 'package:olx/utils/Configuracoes.dart';
import 'package:olx/widgets/BotaoCustomizado.dart';
import 'package:olx/widgets/DropDownCustimizado.dart';
import 'package:olx/widgets/InputCustomizado.dart';
import 'package:validadores/Validador.dart';

class CadastroAnuncio extends StatefulWidget {
  const CadastroAnuncio({Key key}) : super(key: key);

  @override
  _CadastroAnuncioState createState() => _CadastroAnuncioState();
}

class _CadastroAnuncioState extends State<CadastroAnuncio> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  List<File> _listaImagens = [];
  Anuncio _anuncio;
  BuildContext _dialogContext;

  List<DropdownMenuItem<String>> _estados = [];
  List<DropdownMenuItem<String>> _categorias = [];

  String _estadoSelecionado;
  String _categoriaSelecionada;

  TextEditingController _tituloController = TextEditingController();
  TextEditingController _precoController = TextEditingController();
  TextEditingController _telefoneController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  double _opacidade = 1;

  void _inicializarAnuncio() {
    CollectionReference anuncios = _firestore.collection("meus_anuncios");
    _anuncio = Anuncio(
      /**
       * Configura um id incial
       */
      id: anuncios.doc().id,
      fotos: [],
    );
  }

  void _salvarAnuncio() async {
    _bloquearTela();
    // Upload de imagens no Storage
    await _uploadImagens();

    // Salvando anúncio no firestore
    String idUsuario = _auth.currentUser.uid;

    _firestore
        .collection("meus_anuncios")
        .doc(idUsuario)
        .collection("anuncios")
        .doc(_anuncio.id)
        .set(_anuncio.toJson())
        .then((_) {
      _firestore
          .collection("anuncios")
          .doc(_anuncio.id)
          .set(_anuncio.toJson())
          .then((_) {
        Navigator.pop(_dialogContext);
        Navigator.pop(context);
      }).catchError((error) {
        print(error.message);
      });
    }).catchError((error) {
      print(error.message);
    });
  }

  void _bloquearTela() {
    setState(() {
      _opacidade = 0.6;
    });

    // Configurando contexto do dialog
    _dialogContext = context;

    showDialog(
      context: _dialogContext,
      /**
       * Cria um bloqueio no dialog
       * o usuário não consegue fechar, clicando fora
       */
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Salvando Anúncio'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _uploadImagens() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();

    for (File imagem in _listaImagens) {
      String nomeImagem = DateTime.now().microsecondsSinceEpoch.toString();

      Reference arquivo =
          pastaRaiz.child("meus_anuncios").child(_anuncio.id).child(nomeImagem);
      UploadTask uploadTask = arquivo.putFile(imagem);
    }

    try {
      Reference imagensAnuncio = pastaRaiz.child("meus_anuncios").child(_anuncio.id); 
      ListResult imagensSalvas = await imagensAnuncio.listAll();

      for (Reference ref in imagensSalvas.items) {
        _anuncio.fotos.add(await ref.getDownloadURL());
      }
    } catch (e) {
      print(e);
    }
  }

  void _selecionarImagemGaleria() async {
    PickedFile pickedFile = await _picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _listaImagens.add(File(pickedFile.path));
      });
    }
  }

  Widget _itemImagem(File file, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.file(file, fit: BoxFit.fitHeight),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _listaImagens.removeAt(index);
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        'Excluir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
        child: CircleAvatar(
          radius: 50,
          backgroundImage: FileImage(
            _listaImagens[index],
          ),
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 0.4),
            child: Center(
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _inicializarAnuncio();

    _estados = Configuracoes.getEstados();
    _categorias = Configuracoes.getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar anúncio'),
      ),
      body: Opacity(
        opacity: _opacidade,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Área de imagens
                          /**
                           * Para validações de formulário em campos que não necessariamente
                           * seja do tipo texto.
                           */
                          FormField<List<File>>(
                            initialValue: _listaImagens,
                            validator: (imagens) {
                              if (imagens.isEmpty) {
                                return 'É preciso adicionar imagens';
                              }

                              return null;
                            },
                            builder: (field) {
                              return Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        _listaImagens.isNotEmpty
                                            ? Expanded(
                                                child: Container(
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        _listaImagens.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return _itemImagem(
                                                        _listaImagens[index],
                                                        index,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        GestureDetector(
                                          onTap: _selecionarImagemGaleria,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.grey[400],
                                              radius: 50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add_a_photo,
                                                    size: 40,
                                                    color: Colors.grey[100],
                                                  ),
                                                  Text(
                                                    'Adicionar',
                                                    style: TextStyle(
                                                      color: Colors.grey[100],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // field.hasError verificar se possui mensagens de erro
                                  (field.hasError)
                                      ? Container(
                                          child: Text(
                                            /**
                                             * Retorna a mensagem de erro
                                             */
                                            field.errorText,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              );
                            },
                          ),
                          // Menus Dropdown
                          Row(
                            children: [
                              Expanded(
                                child: DropDownCustimizado(
                                  valorInicial: _estadoSelecionado,
                                  hint: 'Estados',
                                  items: _estados,
                                  validator: (value) => Validador()
                                      .add(
                                        Validar.OBRIGATORIO,
                                        msg: 'Estado é obrigatório',
                                      )
                                      .valido(value),
                                  onSaved: (estado) {
                                    _anuncio.estado = estado;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _estadoSelecionado = value;
                                      print(_estadoSelecionado);
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                              Expanded(
                                child: DropDownCustimizado(
                                  valorInicial: _categoriaSelecionada,
                                  hint: 'Categorias',
                                  items: _categorias,
                                  validator: (value) => Validador()
                                      .add(
                                        Validar.OBRIGATORIO,
                                        msg: 'Categoria é obrigatória',
                                      )
                                      .valido(value),
                                  onSaved: (categoria) {
                                    _anuncio.categoria = categoria;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _categoriaSelecionada = value;
                                      print(_categoriaSelecionada);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          // Caixas de Texto e botões
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: InputCustomizado(
                              controller: _tituloController,
                              hint: 'Título',
                              onSaved: (titulo) {
                                _anuncio.titulo = titulo;
                              },
                              validator: (value) => Validador()
                                  .add(
                                    Validar.OBRIGATORIO,
                                    msg: 'Título é obrigatório',
                                  )
                                  .valido(value),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: InputCustomizado(
                              controller: _precoController,
                              hint: 'Preço',
                              type: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                RealInputFormatter(centavos: true)
                              ],
                              onSaved: (preco) {
                                _anuncio.preco =
                                    UtilBrasilFields.converterMoedaParaDouble(
                                  preco,
                                );
                              },
                              validator: (value) => Validador()
                                  .add(
                                    Validar.OBRIGATORIO,
                                    msg: 'Preço é obrigatório',
                                  )
                                  .valido(value),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: InputCustomizado(
                              controller: _telefoneController,
                              hint: 'Telefone',
                              type: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],
                              onSaved: (telefone) {
                                _anuncio.telefone = telefone;
                              },
                              validator: (value) => Validador()
                                  .add(
                                    Validar.OBRIGATORIO,
                                    msg: 'Telefone é obrigatório',
                                  )
                                  .valido(value),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: InputCustomizado(
                              controller: _descricaoController,
                              hint: 'Descrição',

                              /**
                               * Quando não é definido um tamanho máximo de linhas
                               * o campo automaticamente extende
                               */
                              maxLines: null,
                              onSaved: (descricao) {
                                _anuncio.descricao = descricao;
                              },
                              validator: (value) => Validador()
                                  .add(
                                    Validar.OBRIGATORIO,
                                    msg: 'Descrição é obrigatório',
                                  )
                                  .maxLength(
                                    200,
                                    msg: 'Tamanho máximo de 200 excedido',
                                  )
                                  .valido(value),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: BotaoCustomizado(
                  texto: 'Cadastrar Anúncio',
                  onPressed: _opacidade < 1
                      ? null
                      : () {
                          if (_formKey.currentState.validate()) {
                            // Salva os campos
                            _formKey.currentState.save();

                            // Salvar o anúncio
                            _salvarAnuncio();
                          }
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
