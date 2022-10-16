# state_management_provider

This app gives us a simple idea for using Provider Package with flutter. This app deals with User data that includes their name and age and uses Provider Package under the hood to manage state.

<img src ="https://github.com/FaizFk/Learn-Google-Technologies/blob/faiz/Flutter/state_management_provider/screenshots/HomeScreen.png?raw=true" height=40% width=40%>   <img src ="https://github.com/FaizFk/Learn-Google-Technologies/blob/faiz/Flutter/state_management_provider/screenshots/AddUserScreen.png?raw=true" height=39% width=39%>

## Why use State Management
Whenever we go from one screen to other screen and comes back to the same screen the data would have been gone. So is there any way so that the data entered is not gone without using Database Storage implementation. The answer is offcourse YES using State Management. Now if in the same app if I had not used State Management Package(Provider) then navigating to screen <i>AddUserScreen</i> and coming back to <i>HomeScreen</i> all the previous User data would have been gone. This would also happen if you rotate your phone. But since I have used State Management this does not happen. Now the question arises which State Mangement system to use?

## Why Provider Package
Provider package is Flutter Favourite that means even Flutter Development team recommends it. It is very easy to use.

### 1) Make a class which extends ChangeNotifier(See example: [user_data](https://github.com/FaizFk/Learn-Google-Technologies/blob/faiz/Flutter/state_management_provider/lib/provider/user_data.dart) in /lib/provider/user_data.dart)
You can store data as well as implement functions in this class. Also if in any function you want to change the data and want it to instantly reflect it in UI then make sure to call `notifyListners()` method.

### 2) Wrap the uppermost Parent Widget with `ChangeNotifierProvider` widget.
Your uppermost Parent widget is generally Material Widget,wrap it with ChangeNotifierProvider widget, this widget will contain property create and then add the class which you made earlier(refer [here](https://github.com/FaizFk/Learn-Google-Technologies/blob/25b524a995d341f21f25af7c0b4a70d23c5da76e/Flutter/state_management_provider/lib/main.dart#L19)), this will let us use data in class to be accessible to all its children.

### 3) Access the class data(Refer [here](https://github.com/FaizFk/Learn-Google-Technologies/blob/25b524a995d341f21f25af7c0b4a70d23c5da76e/Flutter/state_management_provider/lib/screens/home_screen.dart#L21))
Now to access the data just write this line `Provider.of<ClassName>(context)` (replace ClassName with name of your class) this will return the class which contains your data. You can either store this class in any variable and access its data and functions or directly access like `Provider.of<UserData>(context).userList`. You remember the `notifyListeners()` method which we used in class functions, this function force to rebuild the widget wherever `Provider.of<ClassName>(context)` is used and hence instantly update the screen to new changes, if you do not want this to happen just specify property listen:false like  `Provider.of<ClassName>(context,listen:false)` , now this will not rebuild the parent widget.


Although there is lot to provider package but these three steps will help you get started. Checkout this repository and experiment with it. Happy learning.
