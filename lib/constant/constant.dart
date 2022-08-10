// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

const API_KEYS =
    "5ad365f3a4fc21214ca10d8882006e7f00b2edea05bcc27e4d2a1861244f3458";
const API_URL = "https://api.binderbyte.com/";

class Courier {
  Courier({required this.name, this.color = Colors.green, required this.code});

  final String name;
  final Color color;
  final String code;
}

final List<Courier> courierType = [
  Courier(
    name: "JNE",
    color: Colors.red,
    code: "jne",
  ),
  Courier(
    name: "POS Indonesia",
    color: Colors.amber,
    code: "pos",
  ),
  Courier(
    name: "J&T",
    color: Colors.red,
    code: "jnt",
  ),
  Courier(
    name: "Si Cepat",
    color: Colors.blue,
    code: "sicepat",
  ),
  Courier(
    name: "TIKI",
    color: Colors.red,
    code: "tiki",
  ),
  Courier(
    name: "Anter Aja",
    color: Colors.pink,
    code: "anteraja",
  ),
  Courier(
    name: "Wahana",
    color: Colors.lightBlue,
    code: "wahana",
  ),
  Courier(
    name: "jne",
    color: Colors.red,
    code: "ninja",
  ),
  Courier(
    name: "Lion Parcel",
    color: Colors.red,
    code: "lion",
  ),
  Courier(
    name: "PCP Express",
    color: Colors.red,
    code: "pcp",
  ),
  Courier(
    name: "JET Express",
    color: Colors.red,
    code: "jet",
  ),
  Courier(
    name: "Rex Express",
    color: Colors.red,
    code: "rex",
  ),
  Courier(
    name: "First Logistic",
    color: Colors.red,
    code: "first",
  ),
  Courier(
    name: "ID Express",
    color: Colors.red,
    code: "ide",
  ),
  Courier(
    name: "Shopee Express",
    color: Colors.red,
    code: "spx",
  ),
  Courier(
    name: "KGX Express",
    color: Colors.red,
    code: "kgx",
  ),
  Courier(
    name: "SAP Express",
    color: Colors.red,
    code: "sap",
  ),
  Courier(
    name: "jX Express",
    color: Colors.red,
    code: "jxe",
  ),
  Courier(
    name: "RPX",
    color: Colors.red,
    code: "rpx",
  ),
];
