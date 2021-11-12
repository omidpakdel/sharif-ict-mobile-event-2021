using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using Api.Helpers;
using QRCoder;

namespace Api.Utilities
{
    public static class GenerateQrCode
    {
        public static string Generate()
        {
            var qrGenerator = new QRCodeGenerator();
            var qrCodeData =
                qrGenerator.CreateQrCode(Guid.NewGuid().ToString(), QRCodeGenerator.ECCLevel.Q);
            var qrCode = new QRCode(qrCodeData);
            var qrBitmap = qrCode.GetGraphic(60);
            var memoryStream = new MemoryStream();
            qrBitmap.Save(memoryStream, ImageFormat.Png);
            var byteImage = memoryStream.ToArray();
            return Convert.ToBase64String(byteImage);
        }
    }
}