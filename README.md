# neo_study

Source Code
# git

## Checkout
### Begin update code, should checkout all source code
#### git fetch --all
#### git reset --hard origin/main

## Update code:
### 1. Update all file changed:
git add -u :/
### 2. Commit with message:
git commit -m "Update descripe..."
### 3. Add source code to github:
git push

# 07022022 - How to get input text from username and password textfield ?
## Step 1: Define controler
  // Set controller for username
  final myControllerUsername = TextEditingController();
  // Set controller for password
  final myControllerPassword = TextEditingController();
  //End of declare
## Step 2: Link controller to textfield
    TextField(
        controller: myControllerPassword,

## Step 3: Get value of textfield
    onPressed: () {
        print("Try to get username and password");
        String username = myControllerUsername.text;
        print(myControllerUsername.text);
# 08022022 - Check business logic of login screen by username and password.
## Step 1: Check logic
  Upgarde function onPress()
  
  ### username: admin, password: abc123 -> Right
  if( username=="admin" && password=="abc123"){
    // show successful
  }
  ### Other: wrong 
  else{
    // show wrong password
  }
## Step 2: Show the result to login screen

