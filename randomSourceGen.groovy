def prefix = 'randomSource'
def extension = '.csv'

file = new File(prefix + extension)

if (file.exists()) {
    def backupFile = new File(prefix + ".prev" + extension)
    backupFile.withWriter { writer ->
        file.eachLine() {
            writer.writeLine(it)
        }
    }
}

//200 equals approximately 10000 lines
goalSize = 200*args[0].toDouble()
file.withWriter { writer ->
    while (goalSize >= file.size() / 1000) {
        def random = Math.random()
        if (0.5 >= Math.random()) {
            random *= -1
        }
        writer.writeLine(random.toString())
    }
}
