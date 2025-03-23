import 'package:flutter/widgets.dart';
import 'package:waveform_flutter/waveform_flutter.dart' as waveform;
import 'package:waveform_flutter/waveform_flutter.dart';

/// A widget that displays a static waveform visualization of recorded audio.
class StaticWaveform extends StatelessWidget {
  /// Creates a [StaticWaveform] widget.
  ///
  /// The [height] parameter is required and specifies the height of the waveform.
  /// The [amplitudes] parameter is required and contains the list of amplitude values.
  const StaticWaveform({
    required this.height,
    required this.amplitudes,
    this.color = const Color(0xFF000000), // Default to black
    super.key,
  });

  /// The height of the waveform visualization.
  final double height;

  /// The list of amplitude values to display.
  final List<waveform.Amplitude> amplitudes;

  /// The color of the waveform bars.
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: amplitudes.length,
                  itemBuilder: (context, index) => WaveFormBar(
                    animation: const AlwaysStoppedAnimation(1),
                    amplitude: amplitudes[index],
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
