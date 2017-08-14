import java.util.Random;

class SlimeChunk {
  public static void main(String[] args) {
    if (args.length != 3) {
      System.out.println("Supply seed, x, and z coords");
      return;
    }
    int seed = Integer.parseInt(args[0]);
    int chunkX = (int) Math.floor(Integer.parseInt(args[1]) / 16.0);
    int chunkZ = (int) Math.floor(Integer.parseInt(args[2]) / 16.0);
    System.out.println("Chunk coordinates are " + chunkX + ", " + chunkZ);
    boolean is = isSlimeChunk(seed, chunkX, chunkZ);
    if (is) {
      System.out.println("Chunk is a slime chunk!");
    } else {
      System.out.println("Chunk is not a slime chunk :(");
    }
  }

  private static boolean isSlimeChunk(int seed, int xPosition, int zPosition) {
    Random rnd = new Random(seed +
                        (long) (xPosition * xPosition * 0x4c1906) +
                        (long) (xPosition * 0x5ac0db) +
                        (long) (zPosition * zPosition) * 0x4307a7L +
                        (long) (zPosition * 0x5f24f) ^ 0x3ad8025f);
    return rnd.nextInt(10) == 0;
  }
}

