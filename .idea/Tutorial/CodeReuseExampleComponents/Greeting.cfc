component accessors="true" {

    property name="person"       type="Person";
    property name="baseGreeting" type="string" default="Hello, ";

    public Greeting function init(
        required Person person,
        string baseGreeting = variables.baseGreeting
        )
    {
        setPerson( arguments.person );
        setBaseGreeting( arguments.baseGreeting );
        return this;
    }

    public string function getFullName()
    {
        return getPerson().getFullName();
    }

    public string function getGreeting(
           string baseGreeting = getBaseGreeting()
           )
    {
        var fullName = this.getFullName( argumentCollection = arguments );
        var greeting = arguments.baseGreeting & fullName;

        return greeting;
    }

}