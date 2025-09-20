import 'package:flutter/material.dart';
import '../model/product.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  // Datos de ejemplo con URLs de imágenes reales
  final List<Product> products = [
    Product(
      id: '1',
      name: 'iPhone 15',
      description: 'El último smartphone de Apple con cámara avanzada',
      price: 999.99,
      imageUrl: 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400&h=400&fit=crop',
    ),
    Product(
      id: '2',
      name: 'MacBook Pro',
      description: 'Laptop profesional con chip M3',
      price: 1999.99,
      imageUrl: 'https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400&h=400&fit=crop',
    ),
    Product(
      id: '3',
      name: 'AirPods Pro',
      description: 'Auriculares inalámbricos con cancelación de ruido',
      price: 249.99,
      imageUrl: 'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=400&h=400&fit=crop',
    ),
    Product(
      id: '4',
      name: 'iPad Air',
      description: 'Tablet versátil para trabajo y entretenimiento',
      price: 599.99,
      imageUrl: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400&h=400&fit=crop',
    ),
    Product(
      id: '5',
      name: 'Apple Watch',
      description: 'Smartwatch con monitoreo de salud',
      price: 399.99,
      imageUrl: 'https://images.unsplash.com/photo-1434493789847-2f02dc6ca35d?w=400&h=400&fit=crop',
    ),
    Product(
      id: '6',
      name: 'Samsung Galaxy S24',
      description: 'Smartphone Android con IA integrada',
      price: 899.99,
      imageUrl: 'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=400&h=400&fit=crop',
    ),
    Product(
      id: '7',
      name: 'Sony WH-1000XM5',
      description: 'Audífonos premium con cancelación de ruido',
      price: 349.99,
      imageUrl: 'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400&h=400&fit=crop',
    ),
    Product(
      id: '8',
      name: 'Nintendo Switch',
      description: 'Consola híbrida para juegos en casa y portátil',
      price: 299.99,
      imageUrl: 'https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=400&h=400&fit=crop',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'Catálogo de Productos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${products.length} productos disponibles',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          
          // Products List
          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No hay productos disponibles',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      // Simular actualización
                      await Future.delayed(Duration(seconds: 1));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Productos actualizados'),
                        ),
                      );
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      },
                    ),
                  ),
          ),
        ],
      ),
      
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Función para agregar producto'),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }
}