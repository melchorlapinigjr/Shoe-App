import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog(
      {Key? key, this.radius = 10, required this.mdFileName})
      : super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: Future.delayed(const Duration(milliseconds: 150))
                      .then((value) {
                    return rootBundle
                        .loadString('lib/resources/assets/docs/$mdFileName');
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(
                        data: snapshot.data.toString(),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  })),
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                )),
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: const Text('Close'),
              ))
        ],
      ),
    );
  }
}
