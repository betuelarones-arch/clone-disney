import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';

void main() {
  runApp(const DisneyPlusApp());
}

// Backwards-compatible alias for tests/examples expecting `MyApp`.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DisneyPlusApp();
  }
}

class DisneyPlusApp extends StatelessWidget {
  const DisneyPlusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney+',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0E0B14),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0E0B14),
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF0063E5),
          secondary: Color(0xFF0063E5),
        ),
      ),
      home: const DisneyPlusHome(),
    );
  }
}

class DisneyPlusHome extends StatelessWidget {
  const DisneyPlusHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.network(
            'https://static-assets.bamgrid.com/product/disneyplus/images/logo.svg',
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.play_circle_filled,
              color: Color(0xFF0063E5),
              size: 28,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const HeroSlider(),
          const SizedBox(height: 40),
          _buildContentSection('Top 10 Hoy', [
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/019e1e76-ffee-736f-a0ec-7fa46a5a415f/compose?format=webp&width=467',
              title: 'The Punisher',
              rank: 1,
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/8f08a8df-8b2f-49e1-9130-1e842b90f185/compose?format=webp&width=467',
              title: 'Zootopia 2',
              rank: 2,
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/d2bb248e-f448-442c-9063-3bf24723f278/compose?format=webp&width=467',
              title: '¡Ayuda!',
              rank: 3,
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/35ee3632-230a-4e4b-8520-46063f9282a3/compose?format=webp&width=467',
              title: 'El Diablo Viste a la Moda',
              rank: 4,
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/b39aa962-be56-4b09-a536-98617031717f/compose?format=webp&width=467',
              title: 'Avengers: Endgame',
              rank: 5,
            ),
          ]),
          const SizedBox(height: 40),
          _buildESPNSection(),
          const SizedBox(height: 40),
          _buildContentSection('Recién Agregados', [
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/019cfeb5-04f8-7f5a-8fe0-5e39fd976485/compose?format=webp&width=467',
              title: 'La corona perfecta',
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/019cb517-4957-7ce7-bd55-ee54420c7711/compose?format=webp&width=467',
              title: 'Los Testamentos',
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/019d43c7-b173-7135-b4c6-36993dd9a0c7/compose?format=webp&width=467',
              title: '¡Ayuda!',
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/019d224e-e2f4-74c8-8803-5b674ef84a30/compose?format=webp&width=467',
              title: 'Daredevil: Born Again',
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/b589a828-a253-4912-a25f-624206ac535f/compose?format=webp&width=467',
              title: 'Los Simpson',
            ),
          ]),
          const SizedBox(height: 40),
          _buildContentSection('Series Marvel', [
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/019d224e-e2f4-74c8-8803-5b674ef84a30/compose?format=webp&width=467',
              title: 'Daredevil',
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/019e1e76-ffee-736f-a0ec-7fa46a5a415f/compose?format=webp&width=467',
              title: 'The Punisher',
            ),
            ContentItem(
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg',
              title: 'The Mandalorian',
            ),
            ContentItem(
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/uzpGtNaQSFfYQzbL7J7U3u8YsnI.jpg',
              title: 'WandaVision',
            ),
            ContentItem(
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg',
              title: 'Loki',
            ),
          ]),
          const SizedBox(height: 40),
          _buildContentSection('Clásicos Disney', [
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/8f08a8df-8b2f-49e1-9130-1e842b90f185/compose?format=webp&width=467',
              title: 'Zootopia 2',
            ),
            ContentItem(
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg',
              title: 'Avatar',
            ),
            ContentItem(
              imageUrl:
                  'https://image.tmdb.org/t/p/w500/h0RFKhoV37AWwAsfVdEeuJbkXZO.jpg',
              title: 'Black Panther',
            ),
            ContentItem(
              imageUrl:
                  'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/35ee3632-230a-4e4b-8520-46063f9282a3/compose?format=webp&width=467',
              title: 'El Diablo Viste a la Moda',
            ),
          ]),
          const SizedBox(height: 60),
          _buildBrandsSection(),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildContentSection(String title, List<ContentItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return ContentCard(item: items[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildESPNSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF1A1A2E), const Color(0xFF16213E)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFD32F2F),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'ESPN',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'en Disney+',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Toda la cobertura deportiva: los mejores partidos y eventos en vivo',
            style: GoogleFonts.openSans(
              fontSize: 15,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final sports = [
                  'UEFA Champions League',
                  'NBA',
                  'Premier League',
                  'LaLiga',
                  'Copa Libertadores',
                ];
                return Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white.withAlpha((0.1 * 255).round()),
                    border: Border.all(
                      color: Colors.white.withAlpha((0.2 * 255).round()),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        sports[index],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandsSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Todas tus marcas favoritas',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildBrandCard('Disney', const Color(0xFF0063E5)),
              _buildBrandCard('Pixar', const Color(0xFF0063E5)),
              _buildBrandCard('Marvel', const Color(0xFFED1D24)),
              _buildBrandCard('Star Wars', const Color(0xFF000000)),
              _buildBrandCard('National\nGeographic', const Color(0xFFFCB131)),
              _buildBrandCard('ESPN', const Color(0xFFD32F2F)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBrandCard(String name, Color color) {
    return Container(
      width: 110,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withAlpha((0.3 * 255).round()),
            color.withAlpha((0.1 * 255).round()),
          ],
        ),
        border: Border.all(
          color: color.withAlpha((0.3 * 255).round()),
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HeroSlider extends StatefulWidget {
  const HeroSlider({super.key});

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<HeroItem> _items = [
    HeroItem(
      imageUrl:
          'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/E56F03B7E8BC8B98E753F50B41C37763E8ED767A88B2D071461F05EE32E0EB21/compose?format=webp&width=2560',
      title: 'Zootopia 2',
      subtitle: 'Nueva película original',
    ),
    HeroItem(
      imageUrl:
          'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/5F9C66E4900AC803C4CE12D3F316E2378463FFB07F0DB28A5B799947C0ED07DF/compose?format=webp&width=2560',
      title: 'Daredevil',
      subtitle: 'Nueva serie original de Marvel',
    ),
    HeroItem(
      imageUrl:
          'https://disney.images.edge.bamgrid.com/ripcut-delivery/v2/variant/disney/AC9F2FBB22CFB3031E57A1CF86DD7857E30788D78DE72197C1EEC33125EDA089/compose?format=webp&width=2560',
      title: 'UEFA Champions League',
      subtitle: 'En vivo por ESPN',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < _items.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return HeroCard(item: _items[index]);
            },
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _items.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentPage == index
                    ? Colors.white
                    : Colors.white.withAlpha((0.3 * 255).round()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeroCard extends StatelessWidget {
  final HeroItem item;

  const HeroCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: item.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[900],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[900],
                child: const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withAlpha((0.8 * 255).round()),
                ],
                stops: const [0.5, 1.0],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha((0.5 * 255).round()),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.subtitle,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    color: Colors.white.withAlpha((0.9 * 255).round()),
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha((0.5 * 255).round()),
                        offset: const Offset(0, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.play_arrow, size: 22),
                      label: Text(
                        'Reproducir',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white, width: 2),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.add, size: 22),
                      label: Text(
                        'Mi lista',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final ContentItem item;

  const ContentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  width: 160,
                  height: 200,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 160,
                    height: 200,
                    color: Colors.grey[900],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 160,
                    height: 200,
                    color: Colors.grey[900],
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
              if (item.rank != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0063E5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '#${item.rank}',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.title,
            style: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class HeroItem {
  final String imageUrl;
  final String title;
  final String subtitle;

  HeroItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class ContentItem {
  final String imageUrl;
  final String title;
  final int? rank;

  ContentItem({required this.imageUrl, required this.title, this.rank});
}
