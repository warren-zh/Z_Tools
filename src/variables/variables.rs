use crate::print_variables;
use std::fmt::Debug;

pub fn variables() {
    let _immute_a = 1;
    let mut mut_a = 1;

    print_variables!(
        "Immute A" => _immute_a,
        "Mutable A" => mut_a
    );

    mut_a += 1;

    print_variables!(
        "Immute A" => _immute_a,
        "Mutable A" => mut_a
    );

    let long_lived_binding = 1;
    let shadow_binding = 1;
    { 
        print_variables!(
            "Long Lived Binding" => long_lived_binding,
            "Shadow Binding" => shadow_binding
        );
        
        let shadow_binding = "abc";
        let short_lived_binding = 2;

        print_variables!(
            "Long Lived Binding" => long_lived_binding,
            "Short Lived Binding" => short_lived_binding,
            "Shadow Binding" => shadow_binding
        )
    }

    print_variables!(
        "Long Lived Binding" => long_lived_binding,
        "Shadow Binding" => shadow_binding
    );

    let a_binding;

    {
        let local_x = 2;
        a_binding = local_x * local_x;
    }

    print_variables!(
        "a_binding" => a_binding
    );


}
