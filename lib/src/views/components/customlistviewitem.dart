import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalknasa/src/views/imagedetail_page.dart';
import 'package:flutter/material.dart';

class Customlistviewitem extends StatelessWidget {
  final String title;
  final String data;
  final String imageUrl;
  final String explanation; // Adicione a explicação
  const Customlistviewitem({
    super.key,
    required this.title,
    required this.data,
    required this.imageUrl,
    required this.explanation, // Passe a explicação
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(data),
        leading: ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 44,
            minWidth: 44,
            maxHeight: 64,
            maxWidth: 64,
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ImageDetailPage(imageUrl: imageUrl, explanation: explanation),
            ),
          );
        },
      ),
    );
  }
}
