
import 'package:example/themedata/textstyles.dart';
import 'package:example/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class MultiSelectCheckListScreen extends StatelessWidget {
  MultiSelectCheckListScreen({Key? key}) : super(key: key);

  final MultiSelectController<String> _controller = MultiSelectController();

  @override
  Widget build(BuildContext context) {
    final _items = CryptoModel.getCrypto();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Multi Select Check List'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  _controller.selectAll();
                },
                child: const Text('Select All'))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Select 5 Important Cryptocurrencies',
                style: titleTS,
              ),
            ),
            Expanded(
              child: MultiSelectCheckList(
                maxSelectingCount: 5,
                textStyles: const MultiSelectTextStyles(
                    selectedTextStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                itemsDecoration: MultiSelectDecorations(
                    selectedDecoration:
                        BoxDecoration(color: Colors.indigo.withOpacity(0.8))),
                listViewSettings: ListViewSettings(
                    separatorBuilder: (context, index) => const Divider(
                          height: 0,
                        )),
                controller: _controller,
                items: List.generate(
                    _items.length,
                    (index) => CheckListCard(
                         value: _items[index].id,
                          title: Text(_items[index].title),
                          subtitle: Text(_items[index].subTitle),
                          selectedColor: Colors.white,
                          checkColor: Colors.indigo,
                          selected: index == 3,
                          enabled: !(index == 5),
                          checkBoxBorderSide: const BorderSide(color: Colors.blue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                          )
                        )),
                onChange: (allSelectedItems, selectedItem) {},
                onMaximumSelected: (allSelectedItems, selectedItem) {
                  CustomSnackBar.showInSnackBar(
                      'The limit has been reached', context);
                },
              ),
            )
          ],
        ));
  }
}

class CryptoModel {
  final String id;
  final String title;
  final String subTitle;

  CryptoModel({
    required this.id,
    required this.title,
    required this.subTitle,
  });

  static List<CryptoModel> getCrypto() => [
        CryptoModel(
            id: 'c001',
            title: 'Bitcoin (BTC)',
            subTitle: 'Bitcoin (BTC) is the original cryptocurrency'),
        CryptoModel(
            id: 'c002',
            title: 'Ethereum (ETH)',
            subTitle:
                'Ethereum has also experienced tremendous growth. In just over five years'),
        CryptoModel(
            id: 'c003',
            title: 'Binance Coin (BNB)',
            subTitle:
                'The Binance Coin is a form of cryptocurrency that you can use to trade and pay fees on Binance,'),
        CryptoModel(
            id: 'c004',
            title: 'Tether (USDT)',
            subTitle:
                'Unlike some other forms of cryptocurrency, Tether is a stablecoin, meaning it’s backed by fiat currencies like U.S. dollars and the Euro and hypothetically keeps a value equal to one of those denominations'),
        CryptoModel(
            id: 'c005',
            title: 'Cardano (ADA)',
            subTitle:
                'Cardano’s ADA token has had relatively modest growth compared to other major crypto coins.'),
        CryptoModel(
            id: 'c006',
            title: 'Solana (SOL)',
            subTitle:
                'Developed to help power decentralized finance (DeFi) uses, decentralized apps (DApps) and smart contracts'),
        CryptoModel(
            id: 'c007',
            title: 'XRP (XRP)',
            subTitle:
                ' XRP can be used on that network to facilitate exchanges of different currency types, including fiat currencies and other major cryptocurrencies'),
        CryptoModel(
            id: 'c008',
            title: 'Dogecoin (DOGE)',
            subTitle:
                'Dogecoin’s price in 2017 was \$0.0002. By Oct. 29, 2021, its price was at \$0.29—an almost 145,000% increase.')
      ];
}
