# AI16ROM X6711 Cinema Hardware Contract

Stock MediaTek/Transsion Camera HAL remains underneath the AI16ROM cinematic layer.

Runtime discovery:
- Camera IDs
- Camera facing
- Sensor orientation
- FPS ranges
- Output sizes
- AF modes
- OIS availability
- EIS/video stabilization
- Flash availability
- Camera hardware level
- MediaCodec encoder capabilities

Hardware truth:
- Never advertise unsupported FPS.
- Never advertise unsupported resolution.
- Never claim unavailable OIS.
- Never replace the stock X6711 camera HAL blindly.
- Real slow motion requires exposed high-FPS capture.
- Software slow motion is separate from high-FPS capture.
- MediaCodec capabilities control final export.
- Export resolution/FPS is capability-driven.

Pipeline:
AI Camera -> Real Motion -> Fast Motion -> Slow Motion
-> Movie Shot Engine -> AI Movie Editor
-> AI Effects -> AI Color -> AI Audio
-> MediaCodec Cinema Export.
