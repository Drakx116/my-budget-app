import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:my_budget_app/screens/expense_screen.dart';

enum CameraType { front, rear }

class ScannerWidget extends StatefulWidget
{
  final Widget? overlay;
  final CameraType cameraDefault;
  final ResolutionPreset resolutionPreset;
  final Function(InputImage inputImage) onImage;
  final State<ExpenseScreen> parent;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _image != null ? Image.file(_image!) : const Text('Aucune image sélectionnée.'),
              widget.overlay ?? Container(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(child: const Text('Scanner'), onPressed: _takePhoto),
            ElevatedButton(child: const Text('Choisir'), onPressed: _chooseImage),
            ElevatedButton(child: const Text('Effacer'), onPressed: _reset)
          ]
        )
      ],
    );
  }
}
