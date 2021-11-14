import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:planet_zoo/theme.dart';

import '../../models/animal/animal.dart';

class AnimalDetailScreen extends StatelessWidget {
  final Animal animal;
  const AnimalDetailScreen({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(animal.englishName ?? ''),
              background: CachedNetworkImage(
                imageUrl: animal.images ?? '',
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildInfo('Class:', animal.animalClassId ?? ''),
                    ),
                    Expanded(
                      child: _buildInfo('Genus:', animal.genus ?? ''),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child:
                          _buildInfo('English name:', animal.englishName ?? ''),
                    ),
                    Expanded(
                      child: _buildInfo(
                          'Scientific name:', animal.scientificName ?? ''),
                    ),
                  ],
                ),
                _buildConservationStatus(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildInfo('Habitat:', animal.habitat ?? ''),
                    ),
                    Expanded(
                      child: _buildInfo(
                          'Can be found in:', animal.locations ?? ''),
                    ),
                  ],
                ),
                _buildDescription(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildInfo('Color:', animal.color ?? ''),
                    ),
                    Expanded(
                      child: _buildInfo('Lifespan:', animal.lifespan ?? ''),
                    ),
                  ],
                ),
                _buildInfo('Weight:', animal.animalWeight ?? ''),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildInfo('Height:', animal.animalHeight ?? ''),
                    ),
                    Expanded(
                      child: _buildInfo('Length:', animal.animalLength ?? ''),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildInfo('Age of sexual maturity:',
                          animal.ageOfSexualMaturity ?? ''),
                    ),
                    Expanded(
                      child: _buildInfo(
                          'Age of weaning:', animal.ageOfWeaning ?? ''),
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

  Widget _buildInfo(String title, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            info,
            style:
                TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildConservationStatus() {
    Color color = Colors.black;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Conservation status: ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            animal.conservationStatus ?? '',
            style: TextStyle(fontSize: 18, color: color.withOpacity(0.8)),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExpandablePanel(
            header: const Text(
              'Description: ',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            collapsed: Text(
              animal.description ?? '',
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
            expanded: Text(
              animal.description ?? '',
              softWrap: true,
              style:
                  TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
