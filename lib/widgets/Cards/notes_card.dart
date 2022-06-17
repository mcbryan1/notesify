import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesify/constants/constants.dart';
import 'package:notesify/widgets/Text/content_text.dart';
import 'package:notesify/widgets/Text/title.dart';

Widget noteCard(
  Function()? onTap,
  QueryDocumentSnapshot doc,
) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardColors[doc["color_id"]],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(
            title: doc["note_title"],
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              TitleText(
                title: doc["created_date"],
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              TitleText(
                title: doc["created_time"],
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ContentText(
            title: doc["note_content"],
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
