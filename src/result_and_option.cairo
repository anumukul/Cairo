fn find_even(x:u32)->Option<u32>{


    if x%2==0{

        Option::Some(x)
    }

    else{

        Option::None
    }
}

fn divide(a:u32, b:u32)->Result<u32,ByteArray>{

    if b==0{

        Result::Err("Can't divide with zero")
    }
    else{

        Result::Ok(a/b)
    }
}


#[cfg(test)]

mod tests{

    use super::*;

    #[test]
    fn test_find_even_with_odd(){

        assert!(find_even(5).is_none());
    }

    #[test]

    fn test_find_even_with_even(){

        assert!(find_even(4).is_some());

        
    }

    #[test]

    fn test_divide_by_zero_should_fail(){

        let result=divide(4,0);

        assert!(result.is_err());



    }

     #[test]

    fn test_divide_by_nonzero_should_pass(){

        let result=divide(4,2);

        assert!(result.is_ok());



    }

     #[test]

    fn test_divide_by_zero_should_fail_match(){

        let result=divide(4,0);

       match result{

        Result::Err(_)=>assert!(true),
        Result::Ok(_)=>assert!(false),


       }


    }

     #[test]

    fn test_divide_by_zero_should_fail_match_error(){

        let result=divide(4,0);

       match result{

        Result::Err(error)=>assert!(error=="Can't divide with zero"),
        Result::Ok(_)=>assert!(false),


       }


    }

     #[test]

    fn test_divide_by_zero_should_fail_shorthand(){

        let result=divide(4,0);

         match result{

        Err(error)=>assert!(error=="Can't divide with zero"),
       Ok(_)=>assert!(false),


       }



    }

    

    

   


}