import 'package:flutter/material.dart';

class CryptoModel {
  final String id;
  final String title;
  final String subTitle;
  final Color color;

  CryptoModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.color,
  });

  static List<CryptoModel> getCrypto() => [
        CryptoModel(
            id: 'c001',
            title: 'Bitcoin (BTC)',
            subTitle: 'Bitcoin (BTC) is the original cryptocurrency',
            color: Colors.purple),
        CryptoModel(
            id: 'c002',
            title: 'Ethereum (ETH)',
            subTitle:
                'Ethereum has also experienced tremendous growth. In just over five years',
            color: Colors.indigo),
        CryptoModel(
            id: 'c003',
            title: 'Binance Coin (BNB)',
            subTitle:
                'The Binance Coin is a form of cryptocurrency that you can use to trade and pay fees on Binance,',
            color: Colors.blue),
        CryptoModel(
            id: 'c004',
            title: 'Tether (USDT)',
            subTitle:
                'Unlike some other forms of cryptocurrency, Tether is a stablecoin, meaning it’s backed by fiat currencies like U.S. dollars and the Euro and hypothetically keeps a value equal to one of those denominations',
            color: Colors.green),
        CryptoModel(
            id: 'c005',
            title: 'Cardano (ADA)',
            subTitle:
                'Cardano’s ADA token has had relatively modest growth compared to other major crypto coins.',
            color: Colors.amber),
        CryptoModel(
            id: 'c006',
            title: 'Solana (SOL)',
            subTitle:
                'Developed to help power decentralized finance (DeFi) uses, decentralized apps (DApps) and smart contracts',
            color: Colors.orange),
        CryptoModel(
            id: 'c007',
            title: 'XRP (XRP)',
            subTitle:
                ' XRP can be used on that network to facilitate exchanges of different currency types, including fiat currencies and other major cryptocurrencies',
            color: Colors.redAccent),
        CryptoModel(
            id: 'c008',
            title: 'Dogecoin (DOGE)',
            subTitle:
                'Dogecoin’s price in 2017 was \$0.0002. By Oct. 29, 2021, its price was at \$0.29—an almost 145,000% increase.',
            color: Colors.red),
      ];
}
