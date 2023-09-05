import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});
  @override
  State<MyHome> createState() => _MyHomeState();
}
class _MyHomeState extends State<MyHome> {
  int quantity1 = 0;
  int quantity2 = 0;
  int quantity3 = 0;
  int quantity4 = 0;
  int quantity5 = 0;
  int quantity6 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey.shade600,
          ),
          title: Text(
            'Shopping Cart',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 15,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Image.asset(
                            'assets/bag.png',
                            height: 90,
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  '26.95',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Brown Woman bag',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Jackets',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity1++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(7),
                                width: 30,
                                height: 30,
                                child: Text(
                                  '$quantity1',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity1--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.minimize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/man.png',
                            height: 90,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  '36.95',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Green Man T-Shirt',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Blazers',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity2++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(7),
                                width: 30,
                                height: 30,
                                child: Text(
                                  '$quantity2',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity2--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.minimize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child:
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/jecat.png',
                                height: 90,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    '65.95',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Orange Football Man',
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Dresses',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 10),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity3++;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(7),
                                  width: 30,
                                  height: 30,
                                  child: Text(
                                    '$quantity3',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity3--;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.minimize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/hit.png',
                            height: 70,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  '36.95',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Classic Brown Hat',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Jumpsuits',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity4++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(7),
                                width: 30,
                                height: 30,
                                child: Text(
                                  '$quantity4',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity4--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.minimize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/clom.png',
                            height: 90,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  '22.95',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Blue Classic Shirt ',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Shirts',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity5++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(7),
                                width: 30,
                                height: 30,
                                child: Text(
                                  '$quantity5',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity5--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.minimize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/kids.png',
                            height: 90,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  '50.95',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 4,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Bags Orange School',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Bags',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 10),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity6++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(7),
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '$quantity6',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity6--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.minimize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),);
  }
}
