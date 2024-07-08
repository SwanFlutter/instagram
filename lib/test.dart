import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Future<Directory?>? tempDirectory;
  Future<Directory?>? appSupportDirectory;
  Future<Directory?>? appLibraryDirectory;
  Future<Directory?>? appDocumentsDirectory;
  Future<Directory?>? appCacheDirectory;
  Future<Directory?>? externalDocumentsDirectory;
  Future<List<Directory>?>? externalStorageDirectories;
  Future<List<Directory>?>? externalCacheDirectories;
  Future<Directory?>? downloadsDirectory;

  void _requestAppDocumentsDirectory() {
    setState(() {
      appDocumentsDirectory = getApplicationDocumentsDirectory();
    });
  }

  void _requestAppSupportDirectory() {
    setState(() {
      appSupportDirectory = getApplicationSupportDirectory();
    });
  }

  void _requestAppLibraryDirectory() {
    setState(() {
      appLibraryDirectory = getLibraryDirectory();
    });
  }

  void _requestAppCacheDirectory() {
    setState(() {
      appCacheDirectory = getApplicationCacheDirectory();
    });
  }

  void _requestExternalStorageDirectory() {
    setState(() {
      externalDocumentsDirectory = getExternalStorageDirectory();
    });
  }

  void _requestExternalStorageDirectories(StorageDirectory type) {
    setState(() {
      externalStorageDirectories = getExternalStorageDirectories(type: type);
    });
  }

  void _requestExternalCacheDirectories() {
    setState(() {
      externalCacheDirectories = getExternalCacheDirectories();
    });
  }

  void _requestDownloadsDirectory() {
    setState(() {
      downloadsDirectory = getDownloadsDirectory();
    });
  }

  Widget _buildDirectoryButton(String label,
      Future<Directory?>? directoryFuture, VoidCallback onPressed) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: Text(label),
          ),
          FutureBuilder<Directory?>(
            future: directoryFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('در حال بارگذاری...');
              } else if (snapshot.hasError) {
                return Text('خطا: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Text('مسیر: ${snapshot.data?.path}');
              } else {
                return const Text('هیچ مسیری یافت نشد');
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              _buildDirectoryButton(
                'App Documents Directory',
                appDocumentsDirectory,
                _requestAppDocumentsDirectory,
              ),
              _buildDirectoryButton(
                'App Support Directory',
                appSupportDirectory,
                _requestAppSupportDirectory,
              ),
              _buildDirectoryButton(
                'App Library Directory',
                appLibraryDirectory,
                _requestAppLibraryDirectory,
              ),
              _buildDirectoryButton(
                'App Cache Directory',
                appCacheDirectory,
                _requestAppCacheDirectory,
              ),
              _buildDirectoryButton(
                'External Documents Directory',
                externalDocumentsDirectory,
                _requestExternalStorageDirectory,
              ),
              _buildDirectoryButton(
                'External Cache Directories',
                null,
                _requestExternalCacheDirectories,
              ),
              FutureBuilder<List<Directory>?>(
                future: externalCacheDirectories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('در حال بارگذاری...');
                  } else if (snapshot.hasError) {
                    return Text('خطا: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!
                          .map((directory) => Text('مسیر: ${directory.path}'))
                          .toList(),
                    );
                  } else {
                    return const Text('هیچ مسیری یافت نشد');
                  }
                },
              ),
              _buildDirectoryButton(
                'Downloads Directory',
                downloadsDirectory,
                _requestDownloadsDirectory,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
