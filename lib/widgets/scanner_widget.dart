import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:my_budget_app/resources/colors.dart';
import 'package:my_budget_app/screens/scanner_screen.dart';

enum CameraType { front, rear }

class ScannerWidget extends StatefulWidget
{
  final Widget? overlay;
  final CameraType cameraDefault;
  final ResolutionPreset resolutionPreset;
  final Function(InputImage inputImage) onImage;
  final State<ScannerScreen> parent;

  const ScannerWidget({
    Key? key,
    this.overlay,
    this.cameraDefault = CameraType.rear,
    this.resolutionPreset = ResolutionPreset.high,
    required this.onImage,
    required this.parent
  }) : super(key: key);

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  File? _image;
  ImagePicker? _imagePicker;
  int _cameraIndex = 0;

  CameraDescription get camera => cameras[_cameraIndex];

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await _initializeCamera();
      _refresh();
    });
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();

    if (cameras.length > 1 && widget.cameraDefault == CameraType.front) {
      _cameraIndex = 1;
    }
  }

  Future<void> _chooseImage() async {
    await _getImage(ImageSource.gallery);
  }

  Future<void> _takePhoto() async {
    await _getImage(ImageSource.camera);
  }

  Future<void> _getImage(ImageSource source) async {
    XFile? xfile = await _imagePicker?.pickImage(source: source);

    if (xfile != null) {
      File image = new File(xfile.path);

      setState(() {
        _image = image;
      });

      final img = await decodeImageFromList(image.readAsBytesSync());

      widget.onImage(InputImage.fromFile(
          image,
          metadata: InputImageData(size: Size(img.width.toDouble(), img.height.toDouble())))
      );
    }

    _refresh();
  }

  void _reset() {
    setState(() { _image = null; });

    widget.parent.setState(() {
      widget.parent.widget.price = '0';
    });
  }

  Widget get _userPicture => Container(
    width: MediaQuery.of(context).size.width - 32,
    height: MediaQuery.of(context).size.width - 32,
    decoration: const BoxDecoration(color: Colors.black),
    alignment: Alignment.center,
    child: Image.file(_image!),
  );

  Widget get _scanIcon => GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Image.asset(
        'assets/images/scan.png',
        width: MediaQuery.of(context).size.width - 256,
        color: AppColor.PRIMARY,
      ),
    ),
    onTap: _takePhoto,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: _image != null ? _userPicture : _scanIcon
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: IconButton(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.document_scanner, size: 32),
                        Text(" Scanner")
                      ]
                    ), onPressed: _takePhoto)
                  ),
                  const Text('OU'),
                  Expanded(child: IconButton(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(Icons.upload, size: 32),
                          Text(" Charger")
                        ]
                      ), onPressed: _chooseImage),
                  ),
                ]
              ),
              GestureDetector(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.delete, size: 32),
                  Text('Effacer')
                ],
              ), onTap: _reset),
              const SizedBox(height: 8)
            ],
          ),
        )
      ],
    );
  }
}
