#[cfg(test)]

mod tests{

    #[derive(Drop)]



    struct Person{

        height:u32,
        age:u32,

    }

    fn make_person_older(mut person:Person){

        person.age+=1;
    }

    #[test]

    #[ignore]

    fn test_make_person_older(mut person:Person){

        let mut person=Person{

            height:170,
            age:23,


        };

        make_person_older(person);

       // assert!(person.age==24);
    }

    fn make_person_older_return_ownership(mut person:Person)->Person{

        person.age+=1;
        person
    }

    #[test]

    fn test_return_ownership(){

        let  person=Person{

            height:170,
            age:23,
        };


        let person=make_person_older_return_ownership(person);

        assert!(person.age==24);

    }

    fn make_person_older_with_reference(ref person:Person){

        person.age+=1;
    }

    #[test]

    fn test_make_person_older_with_reference(){

        let mut  person=Person{

            height:170,
            age:23,
        };



        make_person_older_with_reference(ref person);

        assert!(person.age==24);

    }






}