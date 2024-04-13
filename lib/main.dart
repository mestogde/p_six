import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FluroRouter router = FluroRouter();

  MyApp({super.key}) {
    defineRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'project_three',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),Ф
      onGenerateRoute: router.generator,
      home: HomePage(router: router),
    );
  }
}

void defineRoutes(FluroRouter router) {
  router.define(
    '/',
    handler: Handler(handlerFunc: (context, params) => HomePage(router: router,)),
  );
  router.define(
    '/indigo',
    handler: Handler(handlerFunc: (context, params) => const IndigoPage()),
  );
  router.define(
    '/electricIndigo',
    handler: Handler(handlerFunc: (context, params) => const ElectricIndigoPage()),
  );
  router.define(
    '/indigoCobalt',
    handler: Handler(handlerFunc: (context, params) => const IndigoCobaltPage()),
  );
  router.define(
    '/attentionPage',
    handler: Handler(handlerFunc: (context, params) => const AttentionPage()),
  );
  router.define(
    '/searchPage',
    handler: Handler(handlerFunc: (context, params) => const SearchPage()),
  );
  router.define(
    '/indigoDetails',
    handler: Handler(handlerFunc: (context, params) => const IndigoDetails()),
  );
}

class HomePage extends StatelessWidget {
  final FluroRouter router;

  const HomePage({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                router.navigateTo(context, '/indigo', transition: TransitionType.fadeIn);
              },
              child: const Text('Go to Indigo Page'),
            ),
            ElevatedButton(
              onPressed: () {
                router.navigateTo(context, '/electricIndigo', transition: TransitionType.fadeIn);
              },
              child: const Text('Go to Electric Indigo Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/indigoCobalt');
              },
              child: const Text('Go to Indigo Cobalt Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/attentionPage');
              },
              child: const Text('Go to Attention Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/searchPage');
              },
              child: const Text('Go to Search Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class IndigoPage extends StatelessWidget {
  const IndigoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indigo Page'),
      ),
      body: Container(
        color: const Color(0xFFE9D7F2),
        child: const Center(
            child: Text('индиго',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                    fontStyle: FontStyle.italic,
                    fontSize: 50))),
      ),
    );
  }
}

class ElectricIndigoPage extends StatelessWidget {
  const ElectricIndigoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electric Indigo Page'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: Image.network(
              'https://images.unsplash.com/photo-1563181583-d854d08f42b3?q=80&w=2546&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              scale: 3.0,
            )),
      ),
    );
  }
}

class IndigoCobaltPage extends StatelessWidget {
  const IndigoCobaltPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indigo Cobalt Page'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Сине-фиолетовый (Indigo Blue)',
                  style: TextStyle(
                      color: Color.fromRGBO(75, 0, 130, 1), fontSize: 30)),
              subtitle: Text(
                  'Оттенок сочетает в себе глубокие синие и фиолетовые тона, создавая насыщенный и элегантный цвет'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Электрический индиго (Electric Indigo)',
                  style: TextStyle(
                      color: Color.fromRGBO(102, 0, 255, 1), fontSize: 30)),
              subtitle: Text(
                  'Этот оттенок индиго более яркий и насыщенный, чем традиционный индиго, с яркими сине-фиолетовыми оттенками'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Индиго-кобальт (Indigo Cobalt)',
                  style: TextStyle(
                      color: Color.fromRGBO(75, 0, 130, 1), fontSize: 30)),
              subtitle: Text(
                  'Этот оттенок индиго имеет более темные и глубокие синие тона с намеком на фиолетовую окраску'),
            ),
          ],
        ),
      ),
    );
  }
}

class AttentionPage extends StatelessWidget {
  const AttentionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attention Page'),
      ),
      body: Container(
        color: Colors.indigo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Какой цвет мы изучаем?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/indigoDetails');
                },
                child: const Text('Подробнее'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Поиск',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IndigoDetails extends StatelessWidget {
  const IndigoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indigo Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Details about indigo',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
      ),
      body: const Center(
        child: Text(
          'Page not found',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
