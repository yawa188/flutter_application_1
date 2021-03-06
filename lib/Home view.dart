import 'package:flutter/material.dart';
import 'package:flutter_application_1/Contact_model.dart';

import 'contact_details_view.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> data = [
    {
      "name": "Reagan Mcknight",
      "phone": "1-565-827-8982",
      "email": "nonummy.ac@outlook.couk",
      "country": "Pakistan",
      "region": "Pays de la Loire"
    },
    {
      "name": "Macy Mcdowell",
      "phone": "434-5712",
      "email": "tempor.diam@aol.edu",
      "country": "Brazil",
      "region": "Huáběi"
    },
    {
      "name": "Carissa Savage",
      "phone": "1-567-743-4341",
      "email": "vel@google.com",
      "country": "India",
      "region": "Loreto"
    },
    {
      "name": "Bruce Cannon",
      "phone": "582-3896",
      "email": "eros.proin.ultrices@hotmail.com",
      "country": "New Zealand",
      "region": "South Island"
    },
    {
      "name": "Brian Ramos",
      "phone": "674-3271",
      "email": "at.egestas@aol.couk",
      "country": "South Korea",
      "region": "Azad Kashmir"
    },
    {
      "name": "Carlos Harper",
      "phone": "1-238-113-6033",
      "email": "proin.nisl@icloud.org",
      "country": "Russian Federation",
      "region": "Guanacaste"
    },
    {
      "name": "Britanney Dorsey",
      "phone": "871-3241",
      "email": "non@yahoo.couk",
      "country": "Indonesia",
      "region": "Jharkhand"
    },
    {
      "name": "William Ortiz",
      "phone": "1-412-819-7163",
      "email": "molestie.in@yahoo.ca",
      "country": "Vietnam",
      "region": "North Island"
    },
    {
      "name": "Shellie Merrill",
      "phone": "1-241-690-5206",
      "email": "non@google.couk",
      "country": "Turkey",
      "region": "Gorontalo"
    },
    {
      "name": "Clinton Mosley",
      "phone": "1-768-578-0868",
      "email": "sagittis.augue@google.edu",
      "country": "Chile",
      "region": "South Chungcheong"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
            centerTitle: false,
            elevation: 0,
            title: const Text('My Contacts',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            actions: const [
              Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Center(
                      child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/Ena.jpg'))))
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(90),
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Search by name or number',
                          prefixIcon: const Icon(Icons.search)),
                    )))),
        body: SafeArea(
            child: ListView(controller: _scrollController, children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 30,
            ),
            child: Text(
              'Recent',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ContactDetailsView(
                          contact: Contact(
                              country: 'Ghana',
                              email: 'bright@ghanatechlab.com',
                              name: 'Etornam Bright',
                              phone: '+233 24 54 36 757',
                              region: 'Greater Accra'));
                    }));
                  },
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/mawuena.jpg'),
                  ),
                  title: const Text(
                    'Etornam Bright',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text('+233 24 54 36 757'),
                  trailing: const IconButton(
                      onPressed: null, icon: Icon(Icons.more_horiz)),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 25,
                  thickness: 2,
                );
              },
              itemCount: 3),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Contacts',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        groupByValue.substring(0, 1),
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ))),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                          contact: contact,
                        );
                      }));
                    },
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/mawuena.jpg'),
                    ),
                    title: Text(
                      '${element['name']}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('${element['phone']}'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  ),
                  const Divider(
                    indent: 25,
                    thickness: 2,
                  )
                ]);
              },itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional)
    )])),floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
    ));
  }
}
