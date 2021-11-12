using System.Threading.Tasks;

namespace Api.Services
{
    public interface IQrHub
    {
        Task SendMessage(string message);
        Task SendQr(string qrData);
        Task ReceiveFront(string message);
    }
}