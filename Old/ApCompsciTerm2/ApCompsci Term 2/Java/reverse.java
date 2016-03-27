HW#16

//public static String reverse(String w){

//    if (w.length() == 1)
//	return w;
//   else
//   return reverseR(w.substring(1)) + w.substring (0,1);
//  }
// }



//1. Write a recursive reverse(String) method.

// ex.  reverse("cat") -> "tac"
//      reverse("stressed") -> "desserts"





   // Write an iterative count(String word, String letter) to count 
// the occurrences of letter in word.

  // precondition: word.length() >= 0
  //               letter.length() == 1
  // postcondition: count("mississippi","i") -> 4
  //               count("clams","z") -> 0
  //               count("","a") -> 0
public static int count (String word, String letter)


    // Write a recursive count(String word, String letter).