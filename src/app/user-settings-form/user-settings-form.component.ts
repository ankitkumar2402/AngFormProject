import { Component, OnInit } from '@angular/core';
import { NgForm, NgModel } from '@angular/forms';
import { Observable } from 'rxjs';
import { DataService } from '../data/data.service';
import { UserSettings } from '../data/user-settings';

@Component({
  selector: 'app-user-settings-form',
  templateUrl: './user-settings-form.component.html',
  styleUrls: ['./user-settings-form.component.css']
})
export class UserSettingsFormComponent implements OnInit {

  originalUserSettings: UserSettings = {
    name: "",
    emailOffer: false,
    interfaceStyle: "",
    subsricptionType: "",
    notes: ""

  }

  userSettings : UserSettings = {...this.originalUserSettings};
  postError = false;
  postErrorMessage = '';
  subscriptionType!: Observable<string[]>;
  singleModel = "false";

  constructor( private dataService: DataService) { }

  ngOnInit(): void {
    this.subscriptionType = this.dataService.getSubscriptionTypes();
  }

  onHttpError(errorResponse: any): void{
    console.log("post error: " + errorResponse);
    this.postError = true;
    this.postErrorMessage = errorResponse.error.errorMessage;

  }

  onSubmit(form: NgForm): void{
    console.log("form is: "+ form.valid);

    if(form.valid){
      this.dataService.postUserSettingsData(this.userSettings).subscribe(
        result => console.log("success: "+ JSON.stringify(result)),
        error => this.onHttpError(error)
      );
    } else{
      this.postError = true;
      this.postErrorMessage = "Please fix above Errors"
    }

  }

  onBlur(nameField: NgModel): void{
    console.log("on blur field is valid: " + nameField.valid);
  }

}
