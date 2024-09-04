export function holder(count: number, line: number): number[] {
  let s: number[] = [];
  for (let i = 0; i < Math.ceil(count / line) * line - count; i++) {
    s.push(i);
  }
  return s;
}
