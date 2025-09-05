#[cfg(test)]
mod tests {
    #[test]
    fn test_array_macro() {
        
        let mut arr: Array<u8> = ArrayTrait::new();
        arr.append(1);
        arr.append(2);
        arr.append(3);
        arr.append(4);

       
        let front_value: Option<u8> = arr.pop_front();
        
        
        let arr_span = arr.span();
        let first_element: u8 = *arr_span.at(0);
        
       
        let test_value: u8 = *arr_span.get(0).unwrap().unbox();

       
        assert!(arr.len() == 3);
        assert!(front_value == Option::Some(1));
        assert!(first_element == 2);
        assert!(test_value == 2);
    }
    fn add_array(arr:Span<u8>)->u8{

        let mut sum:u8=0;

        for i in 0..arr.len() {

            sum+=*arr.at(i);
        }

        return sum;

    }

    #[test]

    fn test_add_array(){

         let mut arr: Array<u8> = ArrayTrait::new();
        arr.append(1);
        arr.append(2);
        arr.append(3);
        arr.append(4);

        let sum:u8=add_array(arr.span());
        assert!(sum==10);



    }
}