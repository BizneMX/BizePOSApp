import 'dart:io';

import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final String placeholderImage;
  final File? file;
  final double size;

  const ProfileAvatar({
    this.imageUrl,
    required this.placeholderImage,
    super.key,
    this.file,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: size,
        backgroundColor: AppThemes().background,
        child: _buildAvatarImage());
  }

  Widget _buildAvatarImage() {
    if (file != null) {
      return CircleAvatar(
        radius: size,
        backgroundImage: FileImage(file!),
      );
    }
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildPlaceholderImage(placeholderImage);
    } else {
      return FutureBuilder(
        future: _loadNetworkImage(imageUrl!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return _buildPlaceholderImage(placeholderImage);
            } else {
              return CircleAvatar(
                radius: size,
                backgroundImage: NetworkImage(imageUrl!),
              );
            }
          } else {
            return _buildPlaceholderImage(placeholderImage);
          }
        },
      );
    }
  }

  Future<ImageStream> _loadNetworkImage(String url) async {
    try {
      final image = NetworkImage(url).resolve(ImageConfiguration.empty);
      return image;
    } catch (e) {
      throw Exception('Connection error');
    }
  }

  Widget _buildPlaceholderImage(String placeholder) {
    return CircleAvatar(
        radius: size,
        backgroundColor: AppThemes().background,
        backgroundImage: AssetImage(placeholder));
  }
}
