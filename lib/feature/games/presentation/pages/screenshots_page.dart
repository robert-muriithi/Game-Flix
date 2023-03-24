import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScreenshotsPage extends StatefulWidget {
  final String? screenshot;

  const ScreenshotsPage({Key? key, required this.screenshot}) : super(key: key);

  @override
  State<ScreenshotsPage> createState() => _ScreenshotsPageState();
}

class _ScreenshotsPageState extends State<ScreenshotsPage> {
  double _scale = 1.0;
  double _previousScale = 1.0;
  Offset _offset = Offset.zero;
  Offset _previousOffset = Offset.zero;
  final double maxScale = 4.0;

  void _onScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
    _previousOffset = details.focalPoint;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, maxScale);
      _offset = _offset + (details.focalPoint - _previousOffset) / _scale;
      _previousOffset = details.focalPoint;
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _offset += Offset(0, details.delta.dy);
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    _previousScale = 1.0;
  }

  void _resetScale() {
    setState(() {
      _scale = 1.0;
      _offset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screenshots'),
      ),
      body: Center(
        child: GestureDetector(
          //Zoom in the image when tapped
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          onScaleEnd: _onScaleEnd,
          onDoubleTap: _resetScale,
          onVerticalDragUpdate: _onVerticalDragUpdate,
          child: Transform(
            transform: Matrix4.translationValues(_offset.dx, _offset.dy, 0)
              ..scale(_scale),
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: widget.screenshot!,
            ),
          ),
        ),
      ),
    );
  }
}
