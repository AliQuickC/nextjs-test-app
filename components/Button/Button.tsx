"use client";

import { useState } from 'react';

export function Button() {
  const [state, setState] = useState(null);

  return (
    <div>
      <button className="flex h-12 w-full items-center justify-center rounded-full border border-solid border-black/[.08] px-5 transition-colors hover:border-transparent hover:bg-black/[.04] dark:border-white/[.145] dark:hover:bg-[#1a1a1a] md:w-[158px]">
        Client Button
      </button>
    </div>
  );
}
