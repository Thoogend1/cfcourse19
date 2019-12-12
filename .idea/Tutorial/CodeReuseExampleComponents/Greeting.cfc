component {

    property name="baseGreeting" type="string" default="Hello, ";

    public function init(
            string baseGreeting = variables.baseGreeting
            ){
        setBaseGreeting( arguments.baseGreeting );
        return this;
    }

    public string function getFullName(
            required string firstName,
            required string lastName
            )
    {
        var fullName = arguments.firstName & ' ' & arguments.lastName;
        return fullName;
    }

    public string function getGreeting(
            required string firstName,
            required string lastName,
            string baseGreeting = getBaseGreeting()
            )
    {
        var fullName = getFullName( argumentCollection = arguments );
        var greeting = "Hello, " & fullName;

        return greeting;
    }

}