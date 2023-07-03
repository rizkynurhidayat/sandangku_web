class ItemChoice {
  final int id;
  final String label;

  ItemChoice(this.id, this.label);
}

final listTempat = <ItemChoice>[
  ItemChoice(1, 'INDOOR'),
  ItemChoice(2, 'OUTDOOR'),
];
final listJumlah = <ItemChoice>[
  ItemChoice(1, '<50'),
  ItemChoice(2, '51-100'),
  ItemChoice(3, '101-200'),
  ItemChoice(4, 'Other'),
];
