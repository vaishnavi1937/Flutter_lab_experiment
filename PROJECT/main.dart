import 'package:flutter/material.dart';

// --- MAIN APPLICATION SETUP ---
void main() {
  runApp(const BookReviewApp());
}

class BookReviewApp extends StatelessWidget {
  const BookReviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Literary Corner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Set the primary text color for the entire app to dark brown
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF4A3420)),
          bodyMedium: TextStyle(color: Color(0xFF4A3420)),
          titleLarge: TextStyle(color: Color(0xFF4A3420)),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// --- DATA STRUCTURES ---

// 1. Category Data
class Category {
  final String title;
  final IconData icon;
  final Color color;
  final Color categoryPageColor; // Background color for the next page

  const Category(this.title, this.icon, this.color, this.categoryPageColor);
}

// Define the categories for the Home Screen
const List<Category> categories = [
  Category(
    'Fictional',
    Icons.menu_book,
    Color(0xFF8B0000),
    Color(0xFFE0C8D6),
  ), // Deep Red, Lilac/Pink Page
  Category(
    'Personality Development',
    Icons.psychology,
    Color(0xFF191970),
    Color(0xFFC8E0EC),
  ), // Navy Blue, Light Blue Page
  Category(
    'Historical',
    Icons.gavel,
    Color(0xFF654321),
    Color(0xFFEFE8D6),
  ), // Dark Brown, Tan Page
  Category(
    'Autobiography',
    Icons.person_pin,
    Color(0xFF556B2F),
    Color(0xFFD3E0C8),
  ), // Olive Green, Light Green Page
  Category(
    'Business',
    Icons.monetization_on,
    Color(0xFFCD5C5C),
    Color(0xFFE0C8C8),
  ), // Indian Red, Light Red Page
  Category(
    'Thriller',
    Icons.local_fire_department,
    Color(0xFF333333),
    Color(0xFFE9E0D6),
  ), // Dark Grey, Off-White Page
];

// 2. Book Data
class Book {
  final String title;
  final String author;
  final String reviewSummary;
  final String fullReview;
  final String categoryTitle;
  final Color accentColor;

  const Book({
    required this.title,
    required this.author,
    required this.reviewSummary,
    required this.fullReview,
    required this.categoryTitle,
    required this.accentColor,
  });
}

// Sample Book Data
const List<Book> allBooks = [
  // Fictional
  Book(
    title: 'The Silent Observer',
    author: 'Anya Sharma',
    reviewSummary:
        'A gripping mystery with an unexpected twist in the final chapters.',
    fullReview:
        'This novel excels in building atmospheric tension. The pacing is deliberate, leading to a satisfyingly complex resolution. Highly recommended for fans of classic whodunits.',
    categoryTitle: 'Fictional',
    accentColor: Color(0xFF8B0000),
  ),
  Book(
    title: 'The Starfall Prophecy',
    author: 'J.L. Kestrel',
    reviewSummary: 'Epic fantasy world-building and memorable characters.',
    fullReview:
        'A true epic. The author manages a huge cast without losing focus. The magical system is inventive, and the battles are thrilling. Book two is highly anticipated!',
    categoryTitle: 'Fictional',
    accentColor: Color(0xFF8B0000),
  ),
  // Personality Development
  Book(
    title: 'Atomic Habits',
    author: 'James Clear',
    reviewSummary:
        'A practical guide to building good habits and breaking bad ones. Highly actionable.',
    fullReview:
        'Clear provides simple, science-backed strategies for improving every day. This book isn\'t about radical change, but about the power of small, incremental improvements. Essential reading.',
    categoryTitle: 'Personality Development',
    accentColor: Color(0xFF191970),
  ),
  // Historical
  Book(
    title: 'The Guns of August',
    author: 'Barbara W. Tuchman',
    reviewSummary:
        'A brilliant and detailed account of the events leading up to World War I.',
    fullReview:
        'Tuchman\'s masterpiece turns complex history into compelling narrative. Her focus on individual decisions and mistakes leading to the global conflict is mesmerizing. A staple of historical literature.',
    categoryTitle: 'Historical',
    accentColor: Color(0xFF654321),
  ),
  // Autobiography
  Book(
    title: 'Becoming',
    author: 'Michelle Obama',
    reviewSummary: 'An intimate and inspiring memoir of hope and change.',
    fullReview:
        'Michelle Obama shares her journey with grace and honesty, offering profound insights into her life, career, and time in the White House. The writing is warm and deeply engaging.',
    categoryTitle: 'Autobiography',
    accentColor: Color(0xFF556B2F),
  ),
  // Business
  Book(
    title: 'The Lean Startup',
    author: 'Eric Ries',
    reviewSummary:
        'Essential reading for entrepreneurs on validating ideas quickly.',
    fullReview:
        'Ries introduces the concept of the Minimum Viable Product (MVP) and the Build-Measure-Learn feedback loop. It revolutionized how startups are founded and managed. A game-changer.',
    categoryTitle: 'Business',
    accentColor: Color(0xFFCD5C5C),
  ),
  // Thriller
  Book(
    title: 'Gone Girl',
    author: 'Gillian Flynn',
    reviewSummary:
        'A dark and twisted psychological thriller that keeps you guessing until the very end.',
    fullReview:
        'A masterclass in unreliable narration. The sheer suspense and shocking reveals make this a page-turner. Not for the faint of heart, but incredibly well-crafted.',
    categoryTitle: 'Thriller',
    accentColor: Color(0xFF333333),
  ),
];

// Helper function to get books for a category
List<Book> getBooksForCategory(String categoryTitle) {
  return allBooks.where((book) => book.categoryTitle == categoryTitle).toList();
}

// --- HOME SCREEN ---

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // The burnt paper color for the main background
  static const Color burntPaperColor = Color(0xFFEDE0C8);
  static const Color darkBrownText = Color(0xFF4A3420);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: burntPaperColor,
      appBar: AppBar(
        title: const Text(
          'The Literary Corner',
          style: TextStyle(
            color: darkBrownText,
            fontWeight: FontWeight.w900,
            fontFamily: 'Georgia',
          ),
        ),
        backgroundColor: burntPaperColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: darkBrownText),
            onPressed: () {
              // Placeholder for future search implementation
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore by Category',
                style: TextStyle(
                  fontSize: 22,
                  color: darkBrownText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              // --- Horizontal Scrollable Category Bar (The Cartoon Books) ---
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBookIcon(category: categories[index]);
                  },
                ),
              ),
              const SizedBox(height: 30),
              // --- Featured Section Placeholder ---
              const Text(
                'Featured Collections',
                style: TextStyle(
                  fontSize: 22,
                  color: darkBrownText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              // Placeholder for a list of trending/featured books (similar to the image)
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F0E3), // Lighter paper tone
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: darkBrownText.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🖼️ Add an illustrated doodle or bookshelf image
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2232/2232688.png', // 📚 simple book doodle
                      height: 90,
                      width: 90,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '2024 Year\'s Top Bestsellers',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: HomeScreen.darkBrownText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Stay tuned for this section — a curation of timeless reads and trending masterpieces!',
                      style: TextStyle(
                        fontSize: 12,
                        color: HomeScreen.darkBrownText,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- CATEGORY BOOK ICON WIDGET (The new Cartoon Book style) ---
class CategoryBookIcon extends StatelessWidget {
  final Category category;

  const CategoryBookIcon({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: InkWell(
        onTap: () {
          // Navigate to the book list page
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CategoryDetailPage(category: category),
            ),
          );
        },
        child: Column(
          children: [
            // The stacked book icon graphic
            SizedBox(
              width: 55,
              height: 55,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Bottom book (main color)
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: category.color.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  // Middle book (slightly darker)
                  Positioned(
                    top: 5,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: category.color,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 3,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      // Icon on the cover
                      child: Icon(category.icon, color: Colors.white, size: 24),
                    ),
                  ),
                  // Top bookmark/ribbon
                  Positioned(
                    top: 0,
                    right: 8,
                    child: Container(
                      width: 10,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Category Label
            SizedBox(
              width: 60,
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  color: HomeScreen.darkBrownText,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- CATEGORY DETAIL PAGE (Book List) ---
class CategoryDetailPage extends StatelessWidget {
  final Category category;

  const CategoryDetailPage({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> books = getBooksForCategory(category.title);

    return Scaffold(
      // Background color based on the category (e.g., light blue for Personal Dev)
      backgroundColor: category.categoryPageColor,
      appBar: AppBar(
        title: Text(
          '${category.title} Library',
          style: TextStyle(color: category.color, fontWeight: FontWeight.bold),
        ),
        backgroundColor: category.categoryPageColor,
        iconTheme: IconThemeData(color: category.color),
        elevation: 0,
      ),
      body: books.isEmpty
          ? Center(
              child: Text(
                'No books found in the ${category.title} category.',
                style: TextStyle(color: category.color),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookCard(book: books[index]);
              },
            ),
    );
  }
}

// --- BOOK CARD WIDGET ---
class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      color: Colors.white, // White card for readability on colored background
      child: InkWell(
        onTap: () {
          // Navigate to the full review page
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BookDetailPage(book: book)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      book.accentColor, // Use book's category color for title
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'By: ${book.author}',
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: HomeScreen.darkBrownText,
                ),
              ),
              const Divider(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.rate_review, color: book.accentColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      book.reviewSummary,
                      style: const TextStyle(
                        fontSize: 14,
                        color: HomeScreen.darkBrownText,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Tap for Full Review >',
                  style: TextStyle(
                    fontSize: 12,
                    color: book.accentColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- BOOK DETAIL PAGE (Full Review) ---
class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          HomeScreen.burntPaperColor, // Use burnt paper theme for detail page
      appBar: AppBar(
        title: Text(
          book.title,
          style: TextStyle(
            color: book.accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: HomeScreen.burntPaperColor,
        iconTheme: IconThemeData(color: book.accentColor),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: book.accentColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'by ${book.author}',
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: HomeScreen.darkBrownText,
                ),
              ),
              const Divider(height: 40, color: HomeScreen.darkBrownText),
              const Text(
                'Full Review:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: HomeScreen.darkBrownText,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFF7F0E3,
                  ), // Lighter paper tone for the review box
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: book.accentColor.withOpacity(0.4)),
                ),
                child: Text(
                  book.fullReview,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: HomeScreen.darkBrownText,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  // Action to open a dummy store link
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Find in Bookstore'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: book.accentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
