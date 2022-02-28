#!/usr/bin/perl

# Script to brute force a password. It is a little ugly, but it works!
# It currently only uses lower case letters and numbers, and checks words
# from 1 up to 8 characters long.
# Brett Harris 28/2/2022

use Digest::SHA qw(sha256_hex);

#read the password hash
$passwordHash = "04e77bf8f95cb3e1a36a59d1e93857c411930db646b46c218a0352e432023cf2";

# Characters to use
my @a = (a..z,0..9);

# Try one letter
foreach(@a){

    substr($word,0,1) = $_;

    #hash the word
    $wordlistHash = sha256_hex($word);

    print "$word: $wordlistHash\n";

    #if the hash is the same as the correct password's hash then we have cracked the password!
    if($wordlistHash eq $passwordHash) {

        print("Password has been cracked! It was $word\n");

        exit;

    }

}


# Try two letters
foreach(@a){

    substr($word,0,1) = $_;

    foreach(@a){

        substr($word,1,1) = $_;

        #hash the word
        $wordlistHash = sha256_hex($word);

        print "$word: $wordlistHash\n";

        #if the hash is the same as the correct password's hash then we have cracked the password!
        if($wordlistHash eq $passwordHash) {

            print("Password has been cracked! It was $word\n");

            exit;

        }

    }

}

# Try three letters
foreach(@a){

    substr($word,0,1) = $_;
    
    foreach(@a){

        substr($word,1,1) = $_;

        foreach(@a){

            substr($word,2,1) = $_;

            #hash the word
            $wordlistHash = sha256_hex($word);

            print "$word: $wordlistHash\n";

            #if the hash is the same as the correct password's hash then we have cracked the password!
            if($wordlistHash eq $passwordHash) {

                print("Password has been cracked! It was $word\n");

                exit;

            }

        }
    }

}

# Try four letters
foreach(@a){

    substr($word,0,1) = $_;
    
    foreach(@a){

        substr($word,1,1) = $_;
        
        foreach(@a){

            substr($word,2,1) = $_;

            foreach(@a){

                substr($word,3,1) = $_;

                #hash the word
                $wordlistHash = sha256_hex($word);

                print "$word: $wordlistHash\n";

                #if the hash is the same as the correct password's hash then we have cracked the password!
                if($wordlistHash eq $passwordHash) {

                    print("Password has been cracked! It was $word\n");

                    exit;

                }

            }
        }

    }
}

# Try five letters
foreach(@a){

    substr($word,0,1) = $_;

    foreach(@a){

        substr($word,1,1) = $_;
        
        foreach(@a){

            substr($word,2,1) = $_;
            
            foreach(@a){

                substr($word,3,1) = $_;

                foreach(@a){

                    substr($word,4,1) = $_;

                    #hash the word
                    $wordlistHash = sha256_hex($word);

                    print "$word: $wordlistHash\n";

                    #if the hash is the same as the correct password's hash then we have cracked the password!
                    if($wordlistHash eq $passwordHash) {

                        print("Password has been cracked! It was $word\n");

                        exit;

                    }

                }
            }

        }
    }
}

# Try six letters
foreach(@a){

    substr($word,0,1) = $_;

    foreach(@a){

        substr($word,1,1) = $_;

        foreach(@a){

            substr($word,2,1) = $_;
            
            foreach(@a){

                substr($word,3,1) = $_;
                
                foreach(@a){

                    substr($word,4,1) = $_;

                    foreach(@a){

                        substr($word,5,1) = $_;

                        #hash the word
                        $wordlistHash = sha256_hex($word);

                        print "$word: $wordlistHash\n";

                        #if the hash is the same as the correct password's hash then we have cracked the password!
                        if($wordlistHash eq $passwordHash) {

                            print("Password has been cracked! It was $word\n");

                            exit;

                        }

                    }
                }

            }
        }
    }
}

# Try seven letters
foreach(@a){

    substr($word,0,1) = $_;

    foreach(@a){

        substr($word,1,1) = $_;

        foreach(@a){

            substr($word,2,1) = $_;

            foreach(@a){

                substr($word,3,1) = $_;
                
                foreach(@a){

                    substr($word,4,1) = $_;
                    
                    foreach(@a){

                        substr($word,5,1) = $_;

                        foreach(@a){

                            substr($word,6,1) = $_;

                            #hash the word
                            $wordlistHash = sha256_hex($word);

                            print "$word: $wordlistHash\n";

                            #if the hash is the same as the correct password's hash then we have cracked the password!
                            if($wordlistHash eq $passwordHash) {

                                print("Password has been cracked! It was $word\n");

                                exit;

                            }

                        }
                    }

                }
            }
        }
    }
}

# Try eight letters
foreach(@a){

    substr($word,0,1) = $_;

    foreach(@a){

        substr($word,1,1) = $_;

        foreach(@a){

            substr($word,2,1) = $_;

            foreach(@a){

                substr($word,3,1) = $_;

                foreach(@a){

                    substr($word,4,1) = $_;
                    
                    foreach(@a){

                        substr($word,5,1) = $_;
                        
                        foreach(@a){

                            substr($word,6,1) = $_;

                            foreach(@a){

                                substr($word,7,1) = $_;

                                #hash the word
                                $wordlistHash = sha256_hex($word);

                                print "$word: $wordlistHash\n";

                                #if the hash is the same as the correct password's hash then we have cracked the password!
                                if($wordlistHash eq $passwordHash) {

                                    print("Password has been cracked! It was $word\n");

                                    exit;

                                }

                            }
                        }

                    }
                }
            }
        }
    }
}