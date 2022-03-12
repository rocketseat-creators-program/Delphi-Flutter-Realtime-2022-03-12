import 'package:controle_caixa/models/movimentacoes_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final Stream<QuerySnapshot> _movimentacoesStream =
      FirebaseFirestore.instance.collection('movimentacoes').snapshots();

  HomePage({Key? key}) : super(key: key);

  Widget _buildItemCard(MovimentacoesModel model) {
    final dataFormat = DateFormat('dd/MM/yyyy hh:MM:ss');
    return Card(
      color: model.credito > 0.00 ? Colors.white : Colors.red[200],
      elevation: 14,
      child: ListTile(
        title: Text(dataFormat.format(model.datahora.toDate())),
        subtitle: Text(model.descricao),
        trailing: model.credito > 0.00
            ? Text('R\$ ${model.credito.toStringAsFixed(2)}')
            : Text('R\$ ${model.debito.toStringAsFixed(2)}'),
      ),
    );
  }

  Widget _buildSuccess(List<MovimentacoesModel> list) {
    return ListView(
      children: list.map((model) => _buildItemCard(model)).toList(),
    );
  }

  _buildError() {
    return const Center(
      child: Text(
        'Erro ao buscar movimentações!',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controle de Caixa'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _movimentacoesStream,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return _buildError();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          }

          final listaMovimentacoes = snapshot.data!.docs
              .map(
                (doc) => MovimentacoesModel.fromMap(
                  doc.data() as Map<String, dynamic>,
                ),
              )
              .toList();

          return _buildSuccess(listaMovimentacoes);
        },
      ),
    );
  }
}
