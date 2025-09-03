#[cfg(test)]


mod tests{

    #[test]
 

    fn test_immutability(){

        let mut a:u32=45;
          a=22;

          assert!(a==22);
    }

    #[test]

    fn test_shadowing(){


        let a:u32=67;
        let a:u32=23;

        assert!(a==23_u32);

    }

      #[test]

      fn test_constants(){

        const A:u32=10;

        assert!(A==10_u32);
        
      }
}