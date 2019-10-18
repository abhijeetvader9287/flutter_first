To allow image access
1.Register the assets folder in pubspec.yaml
2.Open the pubspec.yaml file that is in the root of your project.
3.Add an assets subsection to the flutter section like this:
flutter:
  assets:
    - assets/images/lake.jpg
4.If you have multiple images that you want to include then you can leave off the file name and just use the directory name (include the final /):
flutter:
   assets:
     - assets/images/


