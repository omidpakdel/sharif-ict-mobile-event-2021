using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Services;
using Api.Utilities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;

namespace Api.Controllers
{
    [ApiController]
    [Route("[controller]/[action]")]
    public class ApiController : ControllerBase
    {
        private readonly ILogger<ApiController> _logger;
        private readonly IHubContext<QrHub> _hub;

        public ApiController(ILogger<ApiController> logger, IHubContext<QrHub> hub)
        {
            _logger = logger;
            _hub = hub;
        }

        [HttpGet]
        public void GenerateQr(string connectionId)
        {
            _hub.Clients.Client(connectionId).SendAsync("SendQr", GenerateQrCode.Generate());
        }
    }
}