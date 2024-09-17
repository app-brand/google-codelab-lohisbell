import 'package:codelab_training/presentation/core/router_core.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class DocumentApp extends StatelessWidget {
  const DocumentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DocumentScreen(
      document: Document(),
    );
  }
}

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({
    required this.block,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: switch (block) {
        HeaderBlock(:var text) => Text(
            text,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ParagraphBlock(:var text) => Text(text),
        CheckboxBlock(:var text, :var isChecked) => Row(
            children: [
              Checkbox(value: isChecked, onChanged: (_) {}),
              Text(text),
            ],
          ),
      },
    );
  }
}

class DocumentScreen extends StatelessWidget {
  final Document document;

  const DocumentScreen({
    required this.document,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // var metadataRecord = document.getMetadata();
    // Desestructurando patrones
    var (title, modified: localModified) = document.getMetadata(); // New
    var blocks = document.getBlocks();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            routerCore.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Last modified $localModified',
            ),
            Expanded(
              child: ListView.builder(
                itemCount: blocks.length,
                itemBuilder: (context, index) {
                  return BlockWidget(block: blocks[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
