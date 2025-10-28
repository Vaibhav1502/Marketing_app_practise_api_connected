import 'package:api_demo_calling/Controllers/blog_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class BlogListScreen extends StatelessWidget {
  final BlogController controller = Get.find<BlogController>();

  BlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Blogs',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: SpinKitFadingCircle(color: Colors.red));
        }
        // if (controller.blog.isEmpty) {
        //   return const Center(child: Text("No Data Found"));
        // }
        return RefreshIndicator(
          color: Colors.red,
          onRefresh: () async {
            await controller.fetchBlog();
          },
          child:
              controller.blog.isEmpty
                  ? ListView(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Center(child: Text("No Data Found")),
                      ),
                    ],
                  )
                  : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    itemCount: controller.blog.length,
                    itemBuilder: (context, index) {
                      final blg = controller.blog[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const BlogDetailScreen(),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image Placeholder
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Container(
                                  height: 180,
                                  width: double.infinity,
                                  color: Colors.grey[300],
                                  child: Image.network(
                                    '${blg.image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // Text Info
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${blg.title}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Icon(Icons.person, size: 14),
                                        SizedBox(width: 6),
                                        Text(
                                          '${blg.author}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          '23 Sep 2025',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${blg.content}',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        );
      }),
    );
  }
}

class BlogDetailScreen extends StatelessWidget {
  const BlogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Blog Title',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.person, size: 16),
                SizedBox(width: 6),
                Text(
                  'Author Name',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
                SizedBox(width: 12),
                Text(
                  '23 Sep 2025',
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                alignment: Alignment.center,
                child: const Icon(Icons.image, size: 60, color: Colors.white70),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'This is where the blog content will appear. It will show the full text, formatted appropriately when real data is provided.',
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
