file = new File(args[0] + '.csv')

while (10000 >= file.size()) {
    def random = Math.random()
    if (0.5 >= Math.random()) {
        random *= -1
    }
    file.append(random+'\n')
}
