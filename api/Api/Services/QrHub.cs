using System;
using System.Threading.Tasks;
using Api.Helpers;
using Microsoft.AspNetCore.SignalR;

namespace Api.Services
{
    public class QrHub : Hub<IQrHub>
    {
        public override Task OnConnectedAsync()
        {
            Console.WriteLine(Context.ConnectionId);
            return base.OnConnectedAsync();
        }

        public void Match(string message, int mode)
        {
            Console.WriteLine(message);
            Console.WriteLine(mode.ToString());
            Clients.All.ReceiveFront(mode.ToString());
        }
    }
}