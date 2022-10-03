import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:olx/models/Anuncio.dart';
import 'package:intl/intl.dart';

class ItemAnuncio extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onRemove;
  final Anuncio anuncio;

  ItemAnuncio({
    @required this.onPressed,
    @required this.anuncio,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: anuncio.fotos.isNotEmpty
                    ? Image.network(
                        anuncio.fotos.first,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey[200],
                      ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    anuncio.titulo,
                    maxLines: 2,
                    softWrap: true,
                  ),
                  subtitle: Text(
                    NumberFormat.currency(
                      locale: 'pt_BR',
                      decimalDigits: 2,
                      symbol: 'R\$',
                    ).format(anuncio.preco),
                  ),
                  trailing: this.onRemove != null
                      ? ElevatedButton(
                        onPressed: this.onRemove,
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      )
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
