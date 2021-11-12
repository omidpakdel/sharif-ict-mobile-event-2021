import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import * as signalR from '@microsoft/signalr';
import { ChangeDetectorRef } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

  imageUrl!: string;

  isText: boolean = false;

  isEntry: boolean = true;

  ngOnInit(): void {
    const connection = new signalR.HubConnectionBuilder()
      .configureLogging(signalR.LogLevel.Information)
      .withUrl('https://localhost:5001/qr')
      .build();


    connection.start().then(() => {
      this.http.get<any>(`https://localhost:5001/api/GenerateQr?connectionId=${connection.connectionId}`).subscribe(
      );

      setInterval(() => {
        this.http.get<any>(`https://localhost:5001/api/GenerateQr?connectionId=${connection.connectionId}`).subscribe(
        );
      }, 10000);

      connection.on('SendQr', (qr: string) => {
        this.imageUrl = 'data:image/png;base64,' + qr;
      });

      connection.on('ReceiveFront', (message: string) => {
        if (message == '1') this.isEntry = true;
        else if (message == '2') this.isEntry = false;
        this.isText = true;
        setTimeout(() => {
          this.isText = false;
        }, 5000)
      })

    }).catch((err) => {
      return console.error(err.toString());
    });


  }

  constructor(private http: HttpClient, private ref: ChangeDetectorRef) { }
  title = 'web';
}
