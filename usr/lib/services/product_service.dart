import '../models/product.dart';

class ProductService {
  // قائمة مؤقتة للمنتجات (ستستبدل بقاعدة بيانات Supabase لاحقاً)
  static List<Product> _products = [
    Product(
      id: '1',
      name: 'هاتف ذكي',
      description: 'هاتف ذكي بمواصفات عالية وكاميرا ممتازة',
      price: 2500.00,
      imageUrl: 'https://via.placeholder.com/300x300.png?text=هاتف+ذكي',
      category: 'إلكترونيات',
      stock: 15,
    ),
    Product(
      id: '2',
      name: 'لابتوب',
      description: 'لابتوب قوي للعمل والألعاب',
      price: 4500.00,
      imageUrl: 'https://via.placeholder.com/300x300.png?text=لابتوب',
      category: 'إلكترونيات',
      stock: 8,
    ),
    Product(
      id: '3',
      name: 'ساعة ذكية',
      description: 'ساعة ذكية لتتبع النشاط والصحة',
      price: 800.00,
      imageUrl: 'https://via.placeholder.com/300x300.png?text=ساعة+ذكية',
      category: 'إكسسوارات',
      stock: 25,
    ),
    Product(
      id: '4',
      name: 'سماعات لاسلكية',
      description: 'سماعات بلوتوث بجودة صوت عالية',
      price: 350.00,
      imageUrl: 'https://via.placeholder.com/300x300.png?text=سماعات',
      category: 'إكسسوارات',
      stock: 30,
    ),
  ];

  // الحصول على جميع المنتجات
  static Future<List<Product>> getAllProducts() async {
    // محاكاة تأخير الشبكة
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_products);
  }

  // الحصول على منتج معين بالمعرف
  static Future<Product?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  // إضافة منتج جديد (للأدمن)
  static Future<bool> addProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _products.add(product);
    return true;
  }

  // تعديل منتج (للأدمن)
  static Future<bool> updateProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      return true;
    }
    return false;
  }

  // حذف منتج (للأدمن)
  static Future<bool> deleteProduct(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products.removeAt(index);
      return true;
    }
    return false;
  }

  // البحث عن منتجات
  static Future<List<Product>> searchProducts(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (query.isEmpty) return List.from(_products);
    
    return _products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
             product.description.toLowerCase().contains(query.toLowerCase()) ||
             product.category.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }
}
