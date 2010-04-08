file = new File('/Users/tim/Documents/CMSCU 498/Research Paper/'+args[0]+'.csv')

while (950 > file.length() / 1000) {
    def random = Math.random()
    if (0.5 >= Math.random()) {
        random *= -1
    }
    file.append(random+'\n')
}