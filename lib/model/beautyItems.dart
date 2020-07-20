class BeautyItems{
  final String title;

  BeautyItems({this.title});

}

List<BeautyItems> loadBeautyItems(){
  var beauty= <BeautyItems>[
    BeautyItems(title: 'Facial'),
    BeautyItems(title: 'Bleach'),
    BeautyItems(title: 'Eyebrow'),
    BeautyItems(title: 'Cutting'),
    BeautyItems(title: 'Spa'),
    BeautyItems(title: 'Skin treatments'),
                  ];
  return beauty;
}