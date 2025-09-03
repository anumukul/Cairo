#[cfg(test)]

mod tests{


    mod simple_enum{

        #[derive(PartialEq,Drop)]


        enum Error{
            DivideByZero,
            DividendSmallerThanDivisor,
            InexactDivision,
        }

        fn divide(dividend :u32, divisor:u32) ->Result<u32,Error>{

            if divisor==0{

                return Result::Err(Error::DivideByZero);
            }
            if divisor>dividend{

               return  Result::Err(Error::DividendSmallerThanDivisor);
            }

            if dividend%divisor!=0{

               return  Result::Err(Error::InexactDivision);
            }

         

                Result::Ok(dividend/divisor)
           
        }


        #[test]

        fn test_simple_enum(){

            let a:u32=56;
            let b:u32=14;

            let result=divide(56,14);


            assert!(result==Result::Ok(4));

        }

    }

        

        mod enums_with_values{

            #[derive(PartialEq,Drop)]


        enum Error{
            DivideByZero,
            DividendSmallerThanDivisor:Division,
            InexactDivision:Remainder,
        }
            

              #[derive(PartialEq,Drop)]
        struct Division{

        dividend:u32,
        divisor:u32,

        }

        type Remainder=u32;

        fn divide(_dividend:u32, _divisor:u32) ->Result<u32,Error>{

           

            if _divisor==0{

                return Result::Err(Error::DivideByZero);
            }
            if _dividend<_divisor{

                 let division=Division{
                dividend:_dividend,
                divisor:_divisor
            
            };

                return Result::Err(Error::DividendSmallerThanDivisor(division));
            }

            if _dividend%_divisor!=0{

                let remainder:Remainder=_dividend%_divisor;

                return Result::Err(Error::InexactDivision(remainder));
            }

            Result::Ok(_dividend/_divisor)



        }

        #[test]

        fn test_enum_with_values(){

            let result=divide(10,2);

            assert!(result==Ok(5));

             let result=divide(10,0);

            assert!(result==Err(Error::DivideByZero));

             let result=divide(10,3);

             let remainder:Remainder=1;

             assert!(result==Err(Error::InexactDivision(remainder)));

             let result=divide(10,15);
             let division=Division{
                dividend:10,
                divisor:15,
            };

             assert!(result==Err(Error::DividendSmallerThanDivisor(division)))





        }


     






        }
    
}