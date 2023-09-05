class PlaceMode{
  String image;
  double price;
  String text;
  String supText;
  int qut;
  PlaceMode({
    required this.image,
    required this.text,
    required this.price,
    required this.supText,
    this.qut=0,
});
}
List<PlaceMode> listMode=[
  PlaceMode(
    image: 'assets/pag.png',
    price: 19.50,
    text: 'Bag Card',
    supText: 'MaxFacter Card',
  ),
  PlaceMode(
    image: 'assets/clom.png',
    price: 40.50,
    text: 'Bag Card',
    supText: 'MaxFacter Card',
  ),
  PlaceMode(
    image: 'assets/jecat.png',
    price: 20.50,
    text: 'Bag Card',
    supText: 'MaxFacter Card',
  ),
  PlaceMode(
    image: 'assets/kids.png',
    price: 30.50,
    text: 'Bag Card',
    supText: 'MaxFacter Card',
  ),
  PlaceMode(
    image: 'assets/hit.png',
    price: 8.50,
    text: 'Bag Card',
    supText: 'MaxFacter Card',
  ),
  PlaceMode(
    image: 'assets/man.png',
    price: 10.50,
    text: 'Bag Card',
    supText: 'MaxFacter Card',
  ),

];