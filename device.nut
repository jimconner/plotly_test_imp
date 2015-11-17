// Device Code

// Establish a global variable to hold environmental data

data <- {}
data.temp <- 0


// This function will be called regularly to take the temperature
// and log it to the device's agent

function getReadings()
{
    // Fake the temperature reading
    data.temp = 1.0 * math.rand() / 16777216;
    
    //send it to the agent
    agent.send("reading", data)

    //back to bed for sixty seconds.
    imp.onidle(function() { server.sleepfor(60) } )
}



// Take a temperature reading as soon as the device starts up
// Note: when the device wakes from sleep (caused by line 86)
// it runs its device code afresh - ie. it does a warm boot

getReadings()


